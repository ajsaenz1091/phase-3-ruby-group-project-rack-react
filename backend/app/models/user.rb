class User < ActiveRecord::Base
    has_many :courses
    has_many :languages, through: :courses

    def self.user_with_courses
        self.all.reduce({}) do |user_w_courses, user| 
            # user_w_courses[user.name] += user.courses
            # user_w_courses[user.name] ||= 
        end
    end
    
    # [
    #     {
    #     "id": 1,
    #     "name": "Robbie Wolff"
    #     courses: [
    #         {
    #         id: 1,
    #         name: "Heirloom authentic helvetica migas.",
    #         rating: 8,
    #         user_id: 1,
    #         language_id: null,
    #         created_at: "2021-07-21T01:51:04.250Z",
    #         updated_at: "2021-07-21T01:51:04.250Z"
    #         }
    #     }  
    # ]
        
end

