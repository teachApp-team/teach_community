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
    },
    {
        full_name: "ruby on rails",
        nickname: "rails",
        password: "password",
        password_confirmation: "password",
        high_school: "開成高校",
        university: "ハーバード大学",
        teacher_id: 1
    },
    {
        full_name: "google python",
        nickname: "python",
        password: "password",
        password_confirmation: "password",
        high_school: "灘高校",
        university: "マサチューセッツ工科大学",
        teacher_id: 2
    },
    {
        full_name: "apple php",
        nickname: "php",
        password: "password",
        password_confirmation: "password",
        high_school: "筑波大学附属高校",
        university: "すダンフォード大学",
        teacher_id: 1
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

Room.create([
    {
        teacher_id: 2,
        student_id: 2
    }
])

Message.create([
    {
        content: "よろしく",
        teacher_id: 2,
        student_id: 2,
        room_id: 1,
        which: 1
    },
    {
        content: "こちらこそです！",
        teacher_id: 2,
        student_id: 2,
        room_id: 1,
        which: 2
    },
    {
        content: "調子どう？",
        teacher_id: 2,
        student_id: 2,
        room_id: 1,
        which: 1
    },
    {
        content: "最高です！",
        teacher_id: 2,
        student_id: 2,
        room_id: 1,
        which: 2
    },
    {
        content: "頑張れよ",
        teacher_id: 2,
        student_id: 1,
        room_id: 1,
        which: 1
    },
    {
        content: "ありがとうございます",
        teacher_id: 2,
        student_id: 1,
        room_id: 1,
        which: 2
    }
])


