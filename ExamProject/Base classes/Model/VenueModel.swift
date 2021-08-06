//
//  VenueModel.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 05.08.2021.
//

import Foundation

struct MetaAndVenueDetailsResponse: Codable {
    let meta: Meta?
    let response: VenueDetailsResponse?
}

struct VenueDetailsResponse: Codable {
    let venue: VenueDetails?
     let location: VenueLocation?
     let canonicalURL: String?
     let categories: [Category]?
     let verified: Bool?
     let stats: Stats?
     let url: String?
     let likes: Likes?
     let rating: Double?
     let ratingColor: String?
     let ratingSignals: Int?
     let beenHere: BeenHere?
     let photos: Listed?
     let page: Page?
     let hereNow: HereNow?
     let createdAt: Int?
     let tips: Listed?
     let shortURL: String?
     let timeZone: String?
     let listed: Listed?
     let phrases: [Phrase]?
     let hours, popular: Hours?
     let pageUpdates, inbox: Inbox?
     let venueChains: [JSONAny]?
     let attributes: Attributes?
     let bestPhoto: Photo?

     enum CodingKeys: String, CodingKey {
         case venue, location
         case canonicalURL = "canonicalUrl"
         case categories, verified, stats, url, likes, rating, ratingColor, ratingSignals, beenHere, photos, page, hereNow, createdAt, tips
         case shortURL = "shortUrl"
         case timeZone, listed, phrases, hours, popular, pageUpdates, inbox, venueChains, attributes, bestPhoto
     }
 }

 // MARK: - Attributes
 struct Attributes: Codable {
     let groups: [Group]?
 }

 // MARK: - HereNow
 struct HereNow: Codable {
     let count: Int?
     let groups: [Group]?
     let summary: String?
 }

 // MARK: - GroupItem
 struct VenueGroupItem: Codable {
     let displayName, displayValue, id, name: String?
     let itemDescription, type: String?
     let user: User?
     let editable, itemPublic, collaborative: Bool?
     let url: String?
     let canonicalURL: String?
     let createdAt, updatedAt: Int?
     let photo: Photo?
     let followers: Followers?
     let listItems: Inbox?
     let source: Source?
     let itemPrefix: String?
     let suffix: String?
     let width, height: Int?
     let visibility, text: String?
     let photourl: String?
     let lang: String?
     let likes: HereNow?
     let logView: Bool?
     let agreeCount, disagreeCount: Int?
     let todo: Followers?
     let editedAt: Int?
     let authorInteractionType: String?

     enum CodingKeys: String, CodingKey {
         case displayName, displayValue, id, name
         case itemDescription = "description"
         case type, user, editable
         case itemPublic = "public"
         case collaborative, url
         case canonicalURL = "canonicalUrl"
         case createdAt, updatedAt, photo, followers, listItems, source
         case itemPrefix = "prefix"
         case suffix, width, height, visibility, text, photourl, lang, likes, logView, agreeCount, disagreeCount, todo, editedAt, authorInteractionType
     }
 }

 // MARK: - Group
 struct VenueGroup: Codable {
     let type: String?
     let name, summary: String?
     let count: Int?
     let items: [VenueGroupItem]?
 }

 // MARK: - Followers
 struct Followers: Codable {
     let count: Int?
 }

 // MARK: - Inbox
 struct Inbox: Codable {
     let count: Int?
     let items: [InboxItem]?
 }

 // MARK: - InboxItem
 struct InboxItem: Codable {
     let id: String?
     let createdAt: Int?
     let photo: Photo?
     let url: String?
 }

 // MARK: - Photo
 struct Photo: Codable {
     let id: String?
     let createdAt: Int?
     let source: Source?
     let photoPrefix: String?
     let suffix: String?
     let width, height: Int?
     let visibility: String?
     let user: User?

     enum CodingKeys: String, CodingKey {
         case id, createdAt, source
         case photoPrefix = "prefix"
         case suffix, width, height, visibility, user
     }
 }

 // MARK: - Source
 struct Source: Codable {
     let name: String?
     let url: String?
 }

 // MARK: - User
 struct User: Codable {
     let firstName, lastName, countryCode: String?
 }

 // MARK: - BeenHere
 struct BeenHere: Codable {
     let count, unconfirmedCount: Int?
     let marked: Bool?
     let lastCheckinExpiredAt: Int?
 }



 // MARK: - Hours
 struct Hours: Codable {
     let status: String?
     let isOpen, isLocalHoliday: Bool?
     let timeframes: [Timeframe]?
 }

 // MARK: - Timeframe
 struct Timeframe: Codable {
     let days: String?
     let includesToday: Bool?
     let timeframeOpen: [Open]?
     let segments: [JSONAny]?

     enum CodingKeys: String, CodingKey {
         case days, includesToday
         case timeframeOpen = "open"
         case segments
     }
 }

 // MARK: - Open
 struct Open: Codable {
     let renderedTime: String?
 }

 // MARK: - Likes
 struct Likes: Codable {
     let count: Int?
     let summary: String?
 }

 // MARK: - Listed
 struct Listed: Codable {
     let count: Int
     let groups: [VenueGroup]
 }

 // MARK: - Location
 struct VenueLocation: Codable {
     let address, crossStreet: String?
     let lat, lng: Double?
     let postalCode, cc, city, state: String?
     let country: String?
     let formattedAddress: [String]?
 }

 // MARK: - Page
 struct Page: Codable {
     let pageInfo: PageInfo?
     let user: User?
 }

 // MARK: - PageInfo
 struct PageInfo: Codable {
     let pageInfoDescription: String?
     let banner: String?
     let links: Inbox?

     enum CodingKeys: String, CodingKey {
         case pageInfoDescription = "description"
         case banner, links
     }
 }

 // MARK: - Phrase
 struct Phrase: Codable {
     let phrase: String?
     let sample: Sample?
     let count: Int?
 }

 // MARK: - Sample
 struct Sample: Codable {
     let entities: [Entity]?
     let text: String?
 }

 // MARK: - Entity
 struct Entity: Codable {
     let indices: [Int]?
     let type: String?
 }

 // MARK: - Stats
 struct Stats: Codable {
     let checkinsCount, usersCount, tipCount, visitsCount: Int?
 }

 // MARK: - Venue
 struct VenueDetails: Codable {
     let id, name: String?
     let contact: Contact?
 }

 // MARK: - Contact
 struct Contact: Codable {
     let phone, formattedPhone, twitter, instagram: String?
     let facebook, facebookUsername, facebookName: String?
 }

 // MARK: - Encode/decode helpers

 class JSONNull: Codable, Hashable {

     public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
         return true
     }

     public var hashValue: Int {
         return 0
     }

     public init() {}

     public required init(from decoder: Decoder) throws {
         let container = try decoder.singleValueContainer()
         if !container.decodeNil() {
             throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
         }
     }

     public func encode(to encoder: Encoder) throws {
         var container = encoder.singleValueContainer()
         try container.encodeNil()
     }
 }

 class JSONCodingKey: CodingKey {
     let key: String

     required init?(intValue: Int) {
         return nil
     }

     required init?(stringValue: String) {
         key = stringValue
     }

     var intValue: Int? {
         return nil
     }

     var stringValue: String {
         return key
     }
 }

 class JSONAny: Codable {

     let value: Any

     static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
         let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
         return DecodingError.typeMismatch(JSONAny.self, context)
     }

     static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
         let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
         return EncodingError.invalidValue(value, context)
     }

     static func decode(from container: SingleValueDecodingContainer) throws -> Any {
         if let value = try? container.decode(Bool.self) {
             return value
         }
         if let value = try? container.decode(Int64.self) {
             return value
         }
         if let value = try? container.decode(Double.self) {
             return value
         }
         if let value = try? container.decode(String.self) {
             return value
         }
         if container.decodeNil() {
             return JSONNull()
         }
         throw decodingError(forCodingPath: container.codingPath)
     }

     static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
         if let value = try? container.decode(Bool.self) {
             return value
         }
         if let value = try? container.decode(Int64.self) {
             return value
         }
         if let value = try? container.decode(Double.self) {
             return value
         }
         if let value = try? container.decode(String.self) {
             return value
         }
         if let value = try? container.decodeNil() {
             if value {
                 return JSONNull()
             }
         }
         if var container = try? container.nestedUnkeyedContainer() {
             return try decodeArray(from: &container)
         }
         if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
             return try decodeDictionary(from: &container)
         }
         throw decodingError(forCodingPath: container.codingPath)
     }

     static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
         if let value = try? container.decode(Bool.self, forKey: key) {
             return value
         }
         if let value = try? container.decode(Int64.self, forKey: key) {
             return value
         }
         if let value = try? container.decode(Double.self, forKey: key) {
             return value
         }
         if let value = try? container.decode(String.self, forKey: key) {
             return value
         }
         if let value = try? container.decodeNil(forKey: key) {
             if value {
                 return JSONNull()
             }
         }
         if var container = try? container.nestedUnkeyedContainer(forKey: key) {
             return try decodeArray(from: &container)
         }
         if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
             return try decodeDictionary(from: &container)
         }
         throw decodingError(forCodingPath: container.codingPath)
     }

     static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
         var arr: [Any] = []
         while !container.isAtEnd {
             let value = try decode(from: &container)
             arr.append(value)
         }
         return arr
     }

     static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
         var dict = [String: Any]()
         for key in container.allKeys {
             let value = try decode(from: &container, forKey: key)
             dict[key.stringValue] = value
         }
         return dict
     }

     static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
         for value in array {
             if let value = value as? Bool {
                 try container.encode(value)
             } else if let value = value as? Int64 {
                 try container.encode(value)
             } else if let value = value as? Double {
                 try container.encode(value)
             } else if let value = value as? String {
                 try container.encode(value)
             } else if value is JSONNull {
                 try container.encodeNil()
             } else if let value = value as? [Any] {
                 var container = container.nestedUnkeyedContainer()
                 try encode(to: &container, array: value)
             } else if let value = value as? [String: Any] {
                 var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                 try encode(to: &container, dictionary: value)
             } else {
                 throw encodingError(forValue: value, codingPath: container.codingPath)
             }
         }
     }

     static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
         for (key, value) in dictionary {
             let key = JSONCodingKey(stringValue: key)!
             if let value = value as? Bool {
                 try container.encode(value, forKey: key)
             } else if let value = value as? Int64 {
                 try container.encode(value, forKey: key)
             } else if let value = value as? Double {
                 try container.encode(value, forKey: key)
             } else if let value = value as? String {
                 try container.encode(value, forKey: key)
             } else if value is JSONNull {
                 try container.encodeNil(forKey: key)
             } else if let value = value as? [Any] {
                 var container = container.nestedUnkeyedContainer(forKey: key)
                 try encode(to: &container, array: value)
             } else if let value = value as? [String: Any] {
                 var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                 try encode(to: &container, dictionary: value)
             } else {
                 throw encodingError(forValue: value, codingPath: container.codingPath)
             }
         }
     }

     static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
         if let value = value as? Bool {
             try container.encode(value)
         } else if let value = value as? Int64 {
             try container.encode(value)
         } else if let value = value as? Double {
             try container.encode(value)
         } else if let value = value as? String {
             try container.encode(value)
         } else if value is JSONNull {
             try container.encodeNil()
         } else {
             throw encodingError(forValue: value, codingPath: container.codingPath)
         }
     }

     public required init(from decoder: Decoder) throws {
         if var arrayContainer = try? decoder.unkeyedContainer() {
             self.value = try JSONAny.decodeArray(from: &arrayContainer)
         } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
             self.value = try JSONAny.decodeDictionary(from: &container)
         } else {
             let container = try decoder.singleValueContainer()
             self.value = try JSONAny.decode(from: container)
         }
     }

     public func encode(to encoder: Encoder) throws {
         if let arr = self.value as? [Any] {
             var container = encoder.unkeyedContainer()
             try JSONAny.encode(to: &container, array: arr)
         } else if let dict = self.value as? [String: Any] {
             var container = encoder.container(keyedBy: JSONCodingKey.self)
             try JSONAny.encode(to: &container, dictionary: dict)
         } else {
             var container = encoder.singleValueContainer()
             try JSONAny.encode(to: &container, value: self.value)
         }
     }
 }
