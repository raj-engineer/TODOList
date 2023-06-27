//
//  HeaderView.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background:Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
            }.padding(.top,80)
        }.frame(width: UIScreen.main.bounds.width*3, height: 350)
            .offset(y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subTitle: "subTitle", angle: 15, background: .yellow)
    }
}
