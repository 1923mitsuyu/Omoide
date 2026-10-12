//
//  OmoideImageResource.swift
//  AppCore
//
//  Created by Ikufumi Mitsuyu on 2026/10/12.
//

import SwiftUI

/// Assets の画像リソースを抽象化し、外部モジュールから利用できるようにする
package enum OmoideImageResource {
  var mapping: ImageResource {
    switch self {}
  }
}

package extension UIImage {
  // クラスの拡張で既存のイニシャライザに委譲するため、convenience を指定 (構造体にはconvenienceは存在しない)
  // UIImage の init(resource:) を利用して、OmoideImageResource を受け取る独自の初期化方法を追加
  // 同じモジュールから区別が付くように呼び出し側の initには外部引数ラベルをつける
  convenience init(omoideImage resource: OmoideImageResource) {
    self.init(resource: resource.mapping)
  }
}

package extension Image {
  // 既存のイニシャライザに委譲し、独自の初期化方法を追加 (convenienceは不要)
  // Image の init(_:) を利用して、OmoideImageResource を受け取る独自の初期化方法を追加
  init(_ resource: OmoideImageResource) {
    self.init(resource.mapping)
  }
}
