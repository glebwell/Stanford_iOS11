//
//  ImageGalleryCollectionViewController.swift
//  ImageGallery
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 ru.yandex.maltcev.gleb. All rights reserved.
//

import UIKit

class ImageGalleryCollectionViewController: UICollectionViewController {

  // MARK: - Public API, Model
  var imageCollection = [ImageModel]()

  override func viewDidLoad() {
    super.viewDidLoad()

    imageCollection = [
      ImageModel(url: URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!,
                 aspectRatio: 0.67
      ),
      ImageModel(url: URL(string: "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg")!,
                 aspectRatio: 1.4
      ),
      ImageModel(url: URL(string: "http://www.picture-newsletter.com/arctic/arctic-12.jpg")!,
                 aspectRatio: 0.75
      )
    ]
  }

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }


  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageCollection.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image Cell", for: indexPath)
    
    if let imageCell = cell as? ImageCollectionViewCell {
      imageCell.imageURL = imageCollection[indexPath.item].url
    }
    
    return cell
  }

  // MARK: Navigation
  /*
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }
  */
}
