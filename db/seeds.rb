
Admin.create([
    { email: 'admin@yahoo.com', password: 'password', password_confirmation: 'password' }
])

projects = Project.create([
    {
        title: 'US Health Project',
        description: '<h1>US Health Project</h1><h3>By US Department of Health</h3>',
        start_date: Date.new(2001, 11, 27),
        finish_date: Date.new(2003,7,17),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Common Welfare Program',
        description: '<h1>Hello world</h1>',
        start_date: Date.new(2012, 1, 1),
        finish_date: Date.new(2013,6,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'COVID19 Vaccine Project',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 1',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 2',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 3',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 4',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 5',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    },
    {
        title: 'Test Proj 6',
        description: '<p>asdf zxcv</p>',
        start_date: Date.new(2020, 6, 15),
        finish_date: Date.new(2022,7,5),
        image: Rails.root.join("app/assets/images/default-project.png").open
    }
])

categories = Category.create([
    { name: 'EMR/EHR' },
    { name: 'HIPAA' },
    { name: 'HL7 Integration' },
    { name: 'MHealth' },
    { name: 'Smart on FHIR' }
])

technologies = Technology.create([
    { title: 'C#' },        { title: 'C/C++' },  { title: 'Python' },
    { title: 'Ruby' },      { title: 'Java' },   { title: 'RoR' },
    { title: 'Django' },    { title: 'Spring' }, { title: '.NET Framework' },
    { title: '.NET Core' }, { title: 'AWS' },    { title: 'Heroku' },
    { title: 'Azure' },     { title: 'Linux' }
])

contributors = Contributor.create([
    {
        name: 'M Irfan',
        email: 'irfan@google.com',
        description: '<h1>M Irfan</h1><p>Hello world</p>',
        join_date: Date.new(2005, 6, 1),
        left_date: nil
    },
    {
        name: 'Steve Jobs',
        description: '<h1>S. Jobs</h1><p>Hello world</p>',
        join_date: Date.new(2011, 3, 15),
        left_date: Date.new(2013, 5, 6)
    },
    {
        name: 'Bill Gates',
        email: 'whgates@gates.com',
        description: '<h1>W. H. Gates</h1><p>Hello w</p>',
        join_date: Date.new(1997, 4, 7),
        left_date: Date.new(2005, 11, 30)
    }
])

projects[0].categories << categories[0..1]
projects[1].categories << categories[2..3]
projects[2].categories << categories[4]

projects[0].technologies << technologies[0] << technologies[1] << technologies[9] # C#, C/C++, .NET Core
projects[1].technologies << technologies[4] << technologies[7] # Java, Spring
projects[2].technologies << technologies[2] << technologies[6] << technologies[10] << technologies[13] # Python, Django, AWS, Linux

projects[0].contributors << contributors[0..1]
projects[1].contributors << contributors[1..2]
projects[2].contributors << contributors[2] << contributors[0]

contributors[0].technologies << technologies[0..2]
contributors[1].technologies << technologies[3..5]
contributors[2].technologies << technologies[6..10]