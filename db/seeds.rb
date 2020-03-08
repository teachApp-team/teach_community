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
        room_id: 1
    },
    {
        content: "こちらこそ",
        teacher_id: 2,
        student_id: 2,
        room_id: 1
    }
])

