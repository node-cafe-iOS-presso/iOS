//
//  KFView.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import SwiftUI
import Kingfisher

struct UrlImageView: View {
    var url: URL
    var size: CGSize?

    init(url: URL, size: CGSize? = nil) {
        self.url = url
        self.size = size
    }

    var body: some View {
        KFImage.url(url)
            .placeholder {
                // 이미지 로딩 중에 표시할 임시 이미지 (선택사항)
//                Image("placeholderImage")
                Color.gray03
            }
            .loadDiskFileSynchronously(true) // 디스크로부터 이미지 동기적으로 로드 (선택사항)
            .cacheMemoryOnly() // 메모리에만 캐시하고 디스크에는 캐시하지 않음 (선택사항)
            .fade(duration: 0.25) // 이미지 로드가 완료되면 이미지를 부드럽게 페이드 인 (선택사항)
            .onProgress { receivedSize, totalSize in
                // 이미지 로딩 진행 상태를 추적하는 클로저 (선택사항)
                //print("이미지 로딩 진행 상태: \(receivedSize)/\(totalSize)")
            }
            .onSuccess { result in
                // 이미지 로드가 성공적으로 완료된 후 호출되는 클로저 (선택사항)
                //print("이미지 로드 성공")
            }
            .onFailure { error in
                // 이미지 로드가 실패한 경우 호출되는 클로저 (선택사항)
                //print("이미지 로딩 실패: \(error)")
            }
            .resizable()// 이미지 프레임 크기 설정
            .aspectRatio(contentMode: .fill) // 이미지 비율 유지하며 프레임에 맞춤
    }
}
