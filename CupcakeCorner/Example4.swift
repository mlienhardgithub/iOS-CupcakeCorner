//
//  Example4.swift
//  CupcakeCorner
//
//  Created by Martin Lienhard on 6/9/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct Example4: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        /*
         prints:  {"_name":"Taylor","_$observationRegistrar":{}}
         
         adding in enum CodingKeys above now maps the User properties to JSON format
         
         prints:  {"name":"Taylor"}
         */
    }
}

#Preview {
    Example4()
}
