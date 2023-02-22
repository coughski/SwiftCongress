//
//  Member.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

import Foundation

struct Member: Identifiable {
    let id: String
    let name: String
    let party: String
    let state: String
    let imageURL: String?
}

extension Member: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "bioguideId"
        case name
        case party
        case state
        case depiction
    }
    
    enum DepictionKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        party = try values.decode(String.self, forKey: .party)
        state = try values.decode(String.self, forKey: .state)
        
        if let depictionValues = try? values.nestedContainer(keyedBy: DepictionKeys.self, forKey: .depiction) {
            imageURL = try depictionValues.decode(String.self, forKey: .imageURL)
        } else {
            imageURL = nil
        }
    }
}

let testJSON = """
{
    "members": [
        {
            "member": {
                "bioguideId": "T000278",
                "depiction": {
                    "attribution": "",
                    "imageUrl": "https://www.congress.gov/img/member/t000278_200.jpg"
                },
                "name": "Tuberville, Tommy",
                "party": "Republican",
                "served": {
                    "Senate": [
                        {
                            "start": 2021
                        }
                    ]
                },
                "state": "Alabama",
                "url": "https://api.congress.gov/v3/member/T000278?format=json"
            }
        }
    ],
    "pagination": {
        "count": 2514,
        "next": "https://api.congress.gov/v3/member?offset=1&limit=1&format=json"
    },
    "request": {
        "contentType": "application/json",
        "format": "json"
    }
}
"""

let dummyResponse = try! JSONDecoder().decode(MemberResponse.self, from: testJSON.data(using: .utf8)!)
