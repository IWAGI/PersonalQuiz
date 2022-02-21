//
//  Question.swift
//  PersonalQuiz
//
//  Created by Mikhail on 21.02.2022.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
    Question(
        text: "Какую пищу вы предпочитаете?",
        type: .single,
        answers: [
            Answer(text: "Стейк", type: .dog),
            Answer(text: "Рыба", type: .cat),
            Answer(text: "Кукуруза", type: .turtle),
            Answer(text: "Морковь", type: .rabbit),
        ]
    ),
    Question(
        text: "Что вам нравится больше?",
        type: .multiple,
        answers: [
            Answer(text: "Плавать", type: .dog),
            Answer(text: "Спать", type: .cat),
            Answer(text: "Есть", type: .turtle),
            Answer(text: "Обниматься", type: .rabbit),
        ]
    ),
    Question(
        text: "Любите ли вы поездки на машине?",
        type: .ranged,
        answers: [
            Answer(text: "Ненавижу", type: .cat),
            Answer(text: " ", type: .rabbit),
            Answer(text: " ", type: .turtle),
            Answer(text: "Обожаю", type: .dog),
        ]
    )
        ]
    }
}
