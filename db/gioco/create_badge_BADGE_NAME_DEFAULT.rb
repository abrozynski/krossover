kind = Kind.find_or_create_by(name: 'DEFAULT')
badge = Badge.create({ 
                      :name => 'BADGE_NAME', 
                      :points => 'POINTS_NUMBER',
                      :kind_id  => kind.id,
                      :default => 'false'
                    })
puts '> Badge successfully created'