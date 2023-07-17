/* 
 Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct Providers : Codable {
    let caption : String?
    let images : Images?
    let actions : [Actions]?
    let type : String?
    
    
    init() {
        self.caption = Constants.blankValue
        self.images = Images()
        self.actions = [Actions]()
        self.type = Constants.blankValue
    }
    
    init(caption: String? = nil, images: Images? = nil, actions: [Actions]? = nil, type: String? = nil) {
        self.caption = caption
        self.images = images
        self.actions = actions
        self.type = type
    }
    enum CodingKeys: String, CodingKey {
        
        case caption = "caption"
        case images = "images"
        case actions = "actions"
        case type = "type"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.caption, forKey: .caption)
        try container.encodeIfPresent(self.images, forKey: .images)
        try container.encodeIfPresent(self.actions, forKey: .actions)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        images = try values.decodeIfPresent(Images.self, forKey: .images)
        actions = try values.decodeIfPresent([Actions].self, forKey: .actions)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
    
}
