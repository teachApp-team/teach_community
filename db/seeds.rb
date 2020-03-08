Teacher.create([
    {
        full_name: "hiroharu hara",
        nickname: "halhal",
        password: "password",
        password_confirmation: "password",
    },
    {
        full_name: "kosuke fujita",
        nickname: "kosuke",
        password: "password",
        password_confirmation: "password",
    }
])
Student.create([
    {
        full_name: "hiroharu hara",
        nickname: "hiro",
        password: "password",
        password_confirmation: "password",
        high_school: "八王子学園八王子高校",
        university: "東京大学",
        teacher_id: 1
    },
    {
        full_name: "kosuke fujita",
        nickname: "suke",
        password: "password",
        password_confirmation: "password",
        high_school: "都立三鷹高校",
        university: "慶應義塾大学",
        teacher_id: 2
    }
])

Community.create([
    {
        name: "first-community",
        auth_code: 1234,
        openness: false,
        introduction: "hello this is first-community!! nice to meet you"
    },
    {
        name: "second-community",
        openness: true,
        introduction: "こんにちは。自由にご参加ください。"
    }
])

Community.first.teachers << Teacher.first
Community.first.students << Student.first
Community.second.teachers << Teacher.second
Community.second.students << Student.second
