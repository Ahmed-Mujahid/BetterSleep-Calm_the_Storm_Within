/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Hub : Codable {
   
    
	let type : String?
	let image : String?
	let actions : [Actions]?
	let options : [Options]?
	let providers : [Providers]?
	let explicit : Bool?
	let displayname : String?

    init() {
        self.type = Constants.blankValue
       self.image = Constants.blankValue
       self.actions = [Actions]()
       self.options = [Options]()
       self.providers = [Providers]()
       self.explicit = Constants.falseValue
       self.displayname = Constants.blankValue
   }
    
     init(type: String? = nil, image: String? = nil, actions: [Actions]? = nil, options: [Options]? = nil, providers: [Providers]? = nil, explicit: Bool? = nil, displayname: String? = nil) {
        self.type = type
        self.image = image
        self.actions = actions
        self.options = options
        self.providers = providers
        self.explicit = explicit
        self.displayname = displayname
    }
    
	enum CodingKeys: String, CodingKey {

		case type = "type"
		case image = "image"
		case actions = "actions"
		case options = "options"
		case providers = "providers"
		case explicit = "explicit"
		case displayname = "displayname"
	}
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.actions, forKey: .actions)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encodeIfPresent(self.providers, forKey: .providers)
        try container.encodeIfPresent(self.explicit, forKey: .explicit)
        try container.encodeIfPresent(self.displayname, forKey: .displayname)
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		actions = try values.decodeIfPresent([Actions].self, forKey: .actions)
		options = try values.decodeIfPresent([Options].self, forKey: .options)
		providers = try values.decodeIfPresent([Providers].self, forKey: .providers)
		explicit = try values.decodeIfPresent(Bool.self, forKey: .explicit)
		displayname = try values.decodeIfPresent(String.self, forKey: .displayname)
	}

}
