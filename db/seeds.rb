    admin = User.create!( birthdate:              '1993-12-10',
                          country_code:           'France',
                          email:                  'admin@blog.fr',
                          firstname:              'admin',
                          lastname:               'nimda',
                          password:               'adminadmin',
                          password_confirmation:  'adminadmin',
                          phone:                  '0606060606',
                          street:                 '4, rue Jules Guesdes',
                          town:                   'Lille',
                          type:                   'Users::Admin',
                          created_at:             1.week.ago,
                          updated_at:             1.week.ago)

    writer = User.create!( birthdate:          '1993-12-10',
                      country_code:           'France',
                      email:                  'writer@blog.fr',
                      firstname:              'writer',
                      lastname:               'retirw',
                      password:               'adminadmin',
                      password_confirmation:  'adminadmin',
                      phone:                  '0606060606',
                      street:                 '4, rue Jules Guesdes',
                      town:                   'Lille',
                      type:                   'Users::Writer',
                      created_at:             1.week.ago,
                      updated_at:             1.week.ago)

    guest = User.create!( birthdate:      '1993-12-10',
                  country_code:           'France',
                  email:                  'guest@blog.fr',
                  firstname:              'guest',
                  lastname:               'tseug',
                  password:               'adminadmin',
                  password_confirmation:  'adminadmin',
                  phone:                  '0606060606',
                  street:                 '4, rue Jules Guesdes',
                  town:                   'Lille',
                  type:                   'Users::Guest',
                  created_at:             1.week.ago,
                  updated_at:             1.week.ago)