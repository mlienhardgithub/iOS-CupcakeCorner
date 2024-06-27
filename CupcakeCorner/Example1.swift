//
//  Example1.swift
//  CupcakeCorner
//
//  Created by Martin Lienhard on 6/9/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Example1: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        let uri = "https://itunes.apple.com/search?term=taylor+swift&entity=song"
        
        guard let url = URL(string: uri) else {
            print("Invalid URL")
            return
        }

        do {
            //discard the metadata with parameter _
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(
                Response.self,
                from: data
            ) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    Example1()
}
