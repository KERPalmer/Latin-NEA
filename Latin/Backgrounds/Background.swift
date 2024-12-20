//
//  Background.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct Background: View{
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.green)
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .fill(Color.blue)
                .rotationEffect(.degrees(120))
                .edgesIgnoringSafeArea(.all)
                    
            Rectangle()
                .fill(Color.red)
                .rotationEffect(.degrees(30))
                .edgesIgnoringSafeArea(.all)
                
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
