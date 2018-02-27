module Roadmap
    def get_roadmap(roadmap_id)
        response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @user_auth_token })
        @roadmap = JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
        response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @user_auth_token })
        @checkpoint = JSON.parse(response.body)
    end

    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id = @user_id)

    response = self.class.post(api_url("checkpoint_submissions"),
               body: {
                   checkpoint_id: checkpoint_id,
                   assignment_branch: assignment_branch,
                   assignment_commit_link: assignment_commit_link,
                   comment: comment,
                   enrollment_id: enrollment_id
               },
               headers: { "authorization" => @auth_token })
    @submission_id = response.body["id"]
    response
  end

  def update_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id = @user_id, id = @submission_id)

    response = self.class.put(api_url("checkpoint_submissions/:#{id}"),
                               body: {
                                   checkpoint_id: checkpoint_id,
                                   assignment_branch: assignment_branch,
                                   assignment_commit_link: assignment_commit_link,
                                   comment: comment,
                                   enrollment_id: enrollment_id
                               },
                               headers: { "authorization" => @auth_token })
  end

end
