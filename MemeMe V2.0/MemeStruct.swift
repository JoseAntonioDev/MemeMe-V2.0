//
//  MemeStruct.swift
//  MemeMe V2.0
//
//  Created by Jose Antonio Álvarez Vázquez on 9/3/21.
//

import Foundation
import UIKit

class SharingMeme {
    
    struct Meme {
        var topText: String!
        var bottomText: String!
        var originalImage: UIImage!
        var memedImage: UIImage
        // This counter is to overwrite a meme when is edited
        var counter: Int!
   }

    var memes = [Meme]()
    
    static var sharedInstance = SharingMeme()
    init(){}
}
