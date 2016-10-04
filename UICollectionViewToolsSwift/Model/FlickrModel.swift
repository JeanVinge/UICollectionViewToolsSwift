//
//  GithubModel.swift
//  UICollectionViewToolsSwift
//
//  Created by Jean Vinge on 30/07/16.
//  Copyright © 2016 Jean Vinge. All rights reserved.
//

import ObjectMapper

class FlickrModel: Mappable {

    /*
     
     "title": "How did it get in there? via http://ift.tt/29KELz0",
     "link": "https://www.flickr.com/photos/dozhub/28358018900/",
     "media": {"m":"https://farm9.staticflickr.com/8233/28358018900_816690d783_m.jpg"},
     "date_taken": "2016-07-29T20:38:27-08:00",
     "description": " <p><a href=\"https://www.flickr.com/people/dozhub/\">dozhub<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/dozhub/28358018900/\" title=\"How did it get in there? via http://ift.tt/29KELz0\"><img src=\"https://farm9.staticflickr.com/8233/28358018900_816690d783_m.jpg\" width=\"240\" height=\"126\" alt=\"How did it get in there? via http://ift.tt/29KELz0\" /><\/a><\/p> <p>How did it get in there? -<br /> <br /> How did it get in there? – Cats, kittens and kittys, cute and adorable! Aww! (via <a href=\"http://ift.tt/29KELz0\" rel=\"nofollow\">ift.tt/29KELz0<\/a>)<br /> <br /> - via <a href=\"http://ift.tt/29KELz0\" rel=\"nofollow\">ift.tt/29KELz0<\/a>. Cats, kittens and kittys, cute and adorable! Aww!<\/p>",
     "published": "2016-07-30T03:38:27Z",
     "author": "nobody@flickr.com (dozhub)",
     "author_id": "143919671@N07",
     "tags": "cat kitty kitten cute funny aww adorable cats"
     }
     
     */
    
    //
    //MARK: Var and outlet declaration
    //
    
    var title: String?
    var mediaURL: URL?
    var author: String?
    
    //
    //MARK: Init methods
    //
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
     
        title <- map["title"]
        mediaURL <- (map["media.m"], URLTransform())
        author <- map["author"]
    }
}
