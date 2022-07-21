//
//  ItemInfo .swift
//  CS_3
//
//  Created by 노우영 on 2022/07/17.
//

import Foundation

struct ItemInfo {
    var imageName: String
    var title: String
    var locationAndTime: String
    var price: Int
    var chats: Int
    var likes: Int
}

let dummyData: [ItemInfo] = [
    ItemInfo(imageName: "ipadTouchPen", title: "아이패드 터치펜", locationAndTime: "우만1동 * 2분 전", price: 18000, chats: 1, likes: 2),
    ItemInfo(imageName: "galaxyBuds", title: "갤럭시 버즈", locationAndTime: "우만2동 * 끌올 2분 전", price: 30000, chats: 1, likes: 1),
    ItemInfo(imageName: "nintendoSwitch", title: "닌텐도 스위치 판매합니다", locationAndTime: "메탄3동 * 2분 전", price: 250000, chats: 1, likes: 0),
    ItemInfo(imageName: "metamong", title: "메타몽 2세대 미개봉 희귀 띠부씰", locationAndTime: "인계동 * 2일 전", price: 25000, chats: 2, likes: 2),
    ItemInfo(imageName: "golf", title: "여자 골프채세트 풀세트", locationAndTime: "광교1동 * 끌올 5분 전", price: 760000, chats: 1, likes: 10),
    ItemInfo(imageName: "neoAuto", title: "네오오토 바이엘패밀리 카라반", locationAndTime: "우만1동 * 10시간 전", price: 33000000, chats: 0, likes: 3),
    ItemInfo(imageName: "samsungGalaxy", title: "삼성 갤럭시 SM-A217N", locationAndTime: "인계동 * 1분 전", price: 100000, chats: 0, likes: 2),
    ItemInfo(imageName: "shoes", title: "독일군 팝니다", locationAndTime: "인계동 * 끌올 27초 전", price: 45000, chats: 0, likes: 2),
    ItemInfo(imageName: "backpack", title: "베르사체 백팩", locationAndTime: "인계동 * 끌올 25분 전", price: 1690000, chats: 1, likes: 2),
    ItemInfo(imageName: "cycle", title: "자전거", locationAndTime: "광교1동", price: 70000, chats: 5, likes: 18)
]
