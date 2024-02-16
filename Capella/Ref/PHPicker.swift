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
    @Published var presentImage : UIImage?
    
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
                            presentImage = image
                            
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
    @Binding var isPhotoButtonSelected : Bool
    
    let maxPhotosToSelect = 1
    
    var body: some View {
        VStack {
            
            PhotosPicker(
                selection: $vm.selectedPhotos, // holds the selected photos from the picker
                maxSelectionCount: maxPhotosToSelect, // sets the max number of photos the user can select
                selectionBehavior: .ordered, // ensures we get the photos in the same order that the user selected them
                matching: .images // filter the photos library to only show images
            ) {
                
                if let image = vm.presentImage {
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 240)
                    }
                } else {
                    ZStack {
                        Image("NewProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 240)
                        
                        VStack {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .frame(width: 21.88, height: 21.88)
                                .padding(.bottom, 8)
                            
                            Text("새로운 Chatter의\n사진을 추가해주세요!")
                                .font(.captionText1)
                                .foregroundStyle(.white)
                                .lineSpacing(4)
                        }
                    }
                }
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
            isPhotoButtonSelected.toggle()
        }
    }
}

//#Preview {
//    PhotoSelectorView(isPhotoButtonSelected: f)
//}
