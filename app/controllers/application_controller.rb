class ApplicationController < ActionController::API
  JWT_SECRET = ENV['JWT_SECRET']

    # Encode / Decode
    def encode_token(payload)
        JWT.encode(payload, JWT_SECRET)
    end

    def auth_header # {Authorization: 'Bearer <token>'}
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    #Authentication Helper methods
    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    #Authorization Helper methods
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
