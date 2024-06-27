//
//  Example2.swift
//  CupcakeCorner
//
//  Created by Martin Lienhard on 6/8/24.
//

import SwiftUI

struct Example2: View {
    var body: some View {
        //this URL will throw an error
        //let uri = "https://hws.dev/img/bad.png"
        let uri = "https://hws.dev/img/logo.png"
        
        AsyncImage(url: URL(string: uri)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    Example2()
}
