//
//  ImageGalleryCollectionViewController.swift
//  ImageGallery
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 ru.yandex.maltcev.gleb. All rights reserved.
//

import UIKit

class ImageGalleryCollectionViewController: UICollectionViewController {

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }


  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return 0
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image Cell", for: indexPath)
    
    // Configure the cell
    
    return cell
  }

  // MARK: Navigation
  /*
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }
  */
}
