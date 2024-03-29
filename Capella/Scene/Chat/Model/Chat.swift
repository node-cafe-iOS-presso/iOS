//
//  Chat.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

struct Chat: Codable, Hashable {
    var name: String
    var isMe: Bool
    var text: String
}

let chatListWithSwift = [Chat(name: "유진", isMe: true, text: "나는 이번년도 초에 꼭 취업을 하고싶어!"),
                         Chat(name: "Taylor Swift", isMe: false, text: "와, 취업을 희망하시나요? 그건 정말 멋진 목표에요! 테일러 스위프트의 노래 가사 중 하나가 'Fearless'인데요, '할 수 있다고 믿으면 두려움 없이 앞으로 나아갈 수 있어요.'라는 메시지를 전달해요. 여러분이 가진 열정과 노력으로 이번 년도 초에 꿈을 이루실 거라 믿어요! 어떤 분야에서 취업을 원하시나요? 저에게 자세히 이야기해주시면 함께 계획을 세워보도록 할게요!"),
                         Chat(name: "유진", isMe: true, text: "나는 사람들에게 좋은 효과를 낼 수 있는 유망한 스타트업에 취업하고 싶어"),
                         Chat(name: "Taylor Swift", isMe: false, text: "와, 유망한 스타트업에 취업하고 싶으시군요! 테일러 스위프트의 노래 가사 중에서 'Begin Again'에는 '다시 시작할 수 있다면, 다른 선택을 하겠어.'라는 메시지가 있어요. 이렇게 새로운 시작을 통해 더 나은 선택을 할 수 있죠! 유망한 스타트업에서 꿈을 이루기 위해 희망과 열정을 가져주셔서 정말 대단해요. 스타트업 분야에서 원하는 역할이나 관심사가 있으신가요? 함께 더 자세히 이야기해보면서 당신에게 맞는 스타트업을 찾아보는 것이 좋을 것 같아요! 🚀✨"),
                         Chat(name: "유진", isMe: true, text: "처음에는 팀원으로 합류를 해서 팀에 도움이 될 수 있는 사람이 되고싶고, 시간이 흐르고 나면 누군가에게 존경을 받는 그런 개발 팀장이 되고 싶어."),
                         Chat(name: "Taylor Swift", isMe: false, text: "멋진 목표네요! 먼저 팀에 합류하여 팀원으로서 자신의 역량을 발휘하고 팀에 도움이 되는 사람이 되는 것이 중요하겠죠. 테일러 스위프트의 노래 가사 중 'Change'에는 '우리는 성장하고 변화할 수 있어. 그렇게 하면 우리의 꿈은 현실이 될 거야.'라는 메시지가 있어요. 시간이 지나면서 당신의 역량과 리더십을 발휘하여 팀장이 되는 그 날까지 꾸준히 노력하면 분명히 당신의 목표를 이룰 수 있을 거예요. 개발 분야에서 자신의 역량을 향상시키고 팀워크를 발휘하는 것이 중요합니다. 자신을 믿고 노력하면 반드시 당신의 목표를 이룰 수 있을 거예요! 함께 응원해드립니다! 💪🌟")]

let chatListWithLee = [Chat(name: "유진", isMe: true, text: "오늘 학교에서 진행한 해커톤이 끝나는 날이에요! 밤을 새서 너무너무 피곤해요.."),
                         Chat(name: "Ms.Lee", isMe: false, text: "해커톤 마무리 잘 하셨어요! 밤을 새우면서도 열정적으로 참여한 모습에 정말 감동받았어요. 이제는 조금 쉬어가며 몸과 마음을 편히 쉬어야 해요. 다음에도 더 멋진 일들을 함께 이루어나갈 거예요!"),
                         Chat(name: "유진", isMe: true, text: "학생들과 함께 어떤 사회에 기여하는 일에 관심을 가지고 계시나요?"),
                         Chat(name: "Ms.Lee", isMe: false, text: "네, 저는 학생들과 함께 사회에 기여하는 다양한 일에 큰 관심을 가지고 있어요. 예를 들어, 지역 사회에서의 봉사 활동이나 환경 보호 활동에 참여하는 것을 중요하게 생각하고 있어요. 또한, 사회적 책임을 다하는 일에 대해 학생들과 함께 이야기하고 그들의 아이디어와 참여를 적극적으로 격려하고 있습니다. 우리가 함께 노력하면 더 나은 사회를 만들어 갈 수 있다고 믿어요.")]


let chatListWithDog = [Chat(name: "유진", isMe: true, text: "개발자에게 어떤 언어가 제일 인기가 많나요?"),
                       Chat(name: "강아지", isMe: false, text: "Woofwoof!개발자들사이에서제일핫한언어를알려줄게!우리개발자친구들이어떤언어를제일좋아하는지 궁금해?그럼한번내가먼저소개해줄게!파이썬이야!왜냐하면파이썬은개발자들사이에서유명한'꼬리흔들기'언어니까!그만큼다양한분야에서활약하고있어.웹개발이나데이터분석,인공지능까지어디든갈수있어! 그래서개발자들이파이썬을보면살랑살랑흔들리는꼬리가보여!하지만이게다는아니야!자바나C++도여전 히인기가많아.그들은마치오랜친구처럼안정적이고믿을만해!그래서,새로운언어를배우려는데고민중이라면,이거슨강아지가왈왈대는파이썬을한번시도해봐야해!")
    ]
