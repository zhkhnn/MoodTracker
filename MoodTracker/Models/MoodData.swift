//
//  MoodData.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 26.11.2022.
//

import Foundation
struct MoodData{
    let togetherWith: TogetherWith
    let hobby: Hobby
    let sleep: Sleep
    let meditation: Meditation
    let homeCare: HomeCare
    let food: Food
    let couple: Couple
    let beauty: Beauty
    let places: Place
    let weather: Weather
}
struct TogetherWith{
    var moodNames = ["Семья", "Друзья", "Свидание", "Вечеринка"]
    var emojis = [""]
}
struct Hobby{
    var moodNames = ["Кино и ТВ", "Чтение", "Игры", "Спорт", "Отдых"]
    var emojis = [""]
}
struct Sleep{
    var moodNames = ["Ложиться рано", "Хороший сон", "Средний сон", "Плохой Сон"]
    var emojis = [""]
}
struct Meditation{
    var moodNames = ["Медитировать", "Доброта", "Слушать", "Жертвовать", "Дарить подарок"]
    var emojis = [""]
}
struct HomeCare{
    var moodNames = ["Покупки", "Уборка", "Приготовление пищи", "Стирка"]
    var emojis = [""]
}
struct Food{
    var moodNames = ["Есть здоровую пищу", "Фаст-фуд", "Домашняя", "Ресторан", "Доставка", "Не есть мясо", "Ничего сладкого", "Никакой газировки"]
    var emojis = [""]
}
struct Couple{
    var moodNames = ["Цветы", "Поблагодарите", "Время вместе", "Массаж"]
    var emojis = [""]
}
struct Beauty{
    var moodNames = ["Стрижка", "Оздоровление", "Массаж", "Маникюр", "Педикюр", "Уход за кожей", "СПА"]
    var emojis = [""]
}
struct Place{
    var moodNames = ["Дом", "Работа", "Школа", "Гости", "Путешествия", "Спортзал", "Кино", "Природа", "Отпуск"]
    var emojis = [""]
}
struct Weather{
    var moodNames = ["Солнечная", "Облака", "Дождь", "Снег", "Жара", "Буря", "Ветер"]
    var emojis = [""]
}
