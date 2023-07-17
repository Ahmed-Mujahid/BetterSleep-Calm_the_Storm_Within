import Foundation

struct Track : Codable {
    let layout : String?
    let type : String?
    let key : String?
    let title : String?
    let subtitle : String?
    let share : Share?
    let images : Images?
    let hub : Hub?
    let artists : [Artists]?
    let url : String?
    
    init() {
        self.layout = Constants.blankValue
        self.type = Constants.blankValue
        self.key = Constants.blankValue
        self.title = Constants.blankValue
        self.subtitle = Constants.blankValue
        self.share = Share()
        self.images = Images()
        self.hub = Hub()
        self.artists = [Artists]()
        self.url = Constants.blankValue
    }
    
    init(layout: String? = nil, type: String? = nil, key: String? = nil, title: String? = nil, subtitle: String? = nil, share: Share? = nil, images: Images? = nil, hub: Hub? = nil, artists: [Artists]? = nil, url: String? = nil) {
        self.layout = layout
        self.type = type
        self.key = key
        self.title = title
        self.subtitle = subtitle
        self.share = share
        self.images = images
        self.hub = hub
        self.artists = artists
        self.url = url
    }
    enum CodingKeys: String, CodingKey {
        
        case layout = "layout"
        case type = "type"
        case key = "key"
        case title = "title"
        case subtitle = "subtitle"
        case share = "share"
        case images = "images"
        case hub = "hub"
        case artists = "artists"
        case url = "url"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.layout, forKey: .layout)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.subtitle, forKey: .subtitle)
        try container.encodeIfPresent(self.share, forKey: .share)
        try container.encodeIfPresent(self.images, forKey: .images)
        try container.encodeIfPresent(self.hub, forKey: .hub)
        try container.encodeIfPresent(self.artists, forKey: .artists)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        layout = try values.decodeIfPresent(String.self, forKey: .layout)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
        share = try values.decodeIfPresent(Share.self, forKey: .share)
        images = try values.decodeIfPresent(Images.self, forKey: .images)
        hub = try values.decodeIfPresent(Hub.self, forKey: .hub)
        artists = try values.decodeIfPresent([Artists].self, forKey: .artists)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
    
}
