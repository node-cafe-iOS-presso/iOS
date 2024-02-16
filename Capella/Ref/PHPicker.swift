//
//  PHPicker.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import SwiftUI
import PhotosUI

class PhotoSelectorViewModel: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        // reset the images array before adding more/new photos
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                            FirebaseStorageManager.uploadImage(image: image, pathRoot: "") { url in
                                if let url = url {
                                    print("myImageUrl : \(url.absoluteString)")
                                    print("이미지 업로드 완료")
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        
        // uncheck the images in the system photo picker
        selectedPhotos.removeAll()
    }
}

struct PhotoSelectorView: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 1
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(300))]) {
                    ForEach(0..<vm.images.count, id: \.self) { index in
                        Image(uiImage: vm.images[index])
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            PhotosPicker(
                selection: $vm.selectedPhotos, // holds the selected photos from the picker
                maxSelectionCount: maxPhotosToSelect, // sets the max number of photos the user can select
                selectionBehavior: .ordered, // ensures we get the photos in the same order that the user selected them
                matching: .images // filter the photos library to only show images
            ) {
                // this label changes the text of photo to match either the plural or singular case based on the value in maxPhotosToSelect
                Label("Select up to ^[\(maxPhotosToSelect) photo](inflect: true)", systemImage: "photo")
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    PhotoSelectorView()
}
