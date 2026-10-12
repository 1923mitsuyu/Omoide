//
//  OmoideColorResource.swift
//  AppCore
//
//  Created by Ikufumi Mitsuyu on 2026/10/12.
//

import SwiftUI

/// Assets の色リソースを抽象化し、外部モジュールから利用できるようにする
package enum OmoideColorResource {
  case textPrimary

  var mapping: ColorResource {
    switch self {
    case .textPrimary: .textPrimary
    }
  }
}

package extension UIColor {
  // クラスの拡張で既存のイニシャライザに委譲するため、convenience を指定 (構造体にはconvenienceは存在しない)
  // UIColor の init(resource:) を利用して、OmoideColorResource を受け取る独自の初期化方法を追加
  //　同じモジュールから区別が付くように呼び出し側の initには外部引数ラベルをつける
  convenience init(omoideColor resource: OmoideColorResource) {
    self.init(resource: resource.mapping)
  }
}

package extension Color {
  // 既存のイニシャライザに委譲し、独自の初期化方法を追加 (convenienceは不要)
  // Color の init(_:) を利用して、OmoideColorResource を受け取る独自の初期化方法を追加
  init(_ resource: OmoideColorResource) {
    self.init(resource.mapping)
  }
}
