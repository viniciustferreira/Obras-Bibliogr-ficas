module V1
  class AuthorAPI < ApplicationAPI

    params do
      requires :number_of_elements, type: Integer
    end

    get :list do
      begin
        Bibliography.first(params[:number_of_elements]).map do |author|  
          Author::Translator.translate(author.name)
        end
      rescue
        error!("internal error", 500)
      end
    end

    params do
      requires :name, type: String
    end

    post :new do
      begin
        Author::Builder.create(params[:name])
      rescue
        error!("internal error", 500)
      end
    end
  end
end