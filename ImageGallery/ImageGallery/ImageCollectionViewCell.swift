//
//  ImageCollectionViewCell.swift
//  ImageGallery
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 ru.yandex.maltcev.gleb. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageGallery: UIImageView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!

  // MARK: - Public API

  var imageURL: URL? {
    didSet { updateUI() }
  }

  private func updateUI() {
    if let url = imageURL {
      spinner?.startAnimating()
      imageGallery.image = nil

      DispatchQueue.global(qos: .userInitiated).async {
        let urlContents = try? Data(contentsOf: url)
        DispatchQueue.main.async {
          if let imageData = urlContents,
            url == self.imageURL,
            let image = UIImage(data: imageData) {
            self.imageGallery?.image = image
          }
          self.spinner?.stopAnimating()
        }
      }
    }
  }
}
