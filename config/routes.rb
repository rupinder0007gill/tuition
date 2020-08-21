# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                      new_user_session GET    /login(.:format)                                                                         users/sessions#new
#                          user_session POST   /login(.:format)                                                                         users/sessions#create
#                  destroy_user_session DELETE /logout(.:format)                                                                        users/sessions#destroy
#                     new_user_password GET    /secret/new(.:format)                                                                    users/passwords#new
#                    edit_user_password GET    /secret/edit(.:format)                                                                   users/passwords#edit
#                         user_password PATCH  /secret(.:format)                                                                        users/passwords#update
#                                       PUT    /secret(.:format)                                                                        users/passwords#update
#                                       POST   /secret(.:format)                                                                        users/passwords#create
#              cancel_user_registration GET    /register/cancel(.:format)                                                               users/registrations#cancel
#                 new_user_registration GET    /register/sign_up(.:format)                                                              users/registrations#new
#                edit_user_registration GET    /register/edit/profile(.:format)                                                         users/registrations#edit
#                     user_registration PATCH  /register(.:format)                                                                      users/registrations#update
#                                       PUT    /register(.:format)                                                                      users/registrations#update
#                                       DELETE /register(.:format)                                                                      users/registrations#destroy
#                                       POST   /register(.:format)                                                                      users/registrations#create
#                 new_user_confirmation GET    /verification/new(.:format)                                                              users/confirmations#new
#                     user_confirmation GET    /verification(.:format)                                                                  users/confirmations#show
#                                       POST   /verification(.:format)                                                                  users/confirmations#create
#                       new_user_unlock GET    /unblock/new(.:format)                                                                   users/unlocks#new
#                           user_unlock GET    /unblock(.:format)                                                                       users/unlocks#show
#                                       POST   /unblock(.:format)                                                                       users/unlocks#create
#                 user_password_expired GET    /password_expired(.:format)                                                              devise/password_expired#show
#                                       PATCH  /password_expired(.:format)                                                              devise/password_expired#update
#                                       PUT    /password_expired(.:format)                                                              devise/password_expired#update
#                                  root GET    /                                                                                        users/courses#index
#                  approve_users_course GET    /courses/:id/approve(.:format)                                                           users/courses#approve
#                   reject_users_course GET    /courses/:id/reject(.:format)                                                            users/courses#reject
#                         users_courses GET    /courses(.:format)                                                                       users/courses#index
#                                       POST   /courses(.:format)                                                                       users/courses#create
#                      new_users_course GET    /courses/new(.:format)                                                                   users/courses#new
#                     edit_users_course GET    /courses/:id/edit(.:format)                                                              users/courses#edit
#                          users_course GET    /courses/:id(.:format)                                                                   users/courses#show
#                                       PATCH  /courses/:id(.:format)                                                                   users/courses#update
#                                       PUT    /courses/:id(.:format)                                                                   users/courses#update
#                                       DELETE /courses/:id(.:format)                                                                   users/courses#destroy
#              approve_users_enrollment GET    /enrollments/:id/approve(.:format)                                                       users/enrollments#approve
#               reject_users_enrollment GET    /enrollments/:id/reject(.:format)                                                        users/enrollments#reject
#                     users_enrollments GET    /enrollments(.:format)                                                                   users/enrollments#index
#                                       POST   /enrollments(.:format)                                                                   users/enrollments#create
#                  new_users_enrollment GET    /enrollments/new(.:format)                                                               users/enrollments#new
#                 edit_users_enrollment GET    /enrollments/:id/edit(.:format)                                                          users/enrollments#edit
#                      users_enrollment GET    /enrollments/:id(.:format)                                                               users/enrollments#show
#                                       PATCH  /enrollments/:id(.:format)                                                               users/enrollments#update
#                                       PUT    /enrollments/:id(.:format)                                                               users/enrollments#update
#                                       DELETE /enrollments/:id(.:format)                                                               users/enrollments#destroy
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               unlock: 'unblock',
               registration: 'register',
               edit: 'edit/profile'
             },
             controllers: {
               sessions: 'users/sessions',
               confirmations: 'users/confirmations',
               passwords: 'users/passwords',
               unlocks: 'users/unlocks',
               registrations: 'users/registrations'
             }

  as :user do
    root 'users/courses#index'
    resources :courses,
              path: 'courses',
              controller: 'users/courses',
              as: :users_courses do
      member do
        get 'approve'
        get 'reject'
      end
    end
    resources :enrollments,
              path: 'enrollments',
              controller: 'users/enrollments',
              as: :users_enrollments do
      member do
        get 'approve'
        get 'reject'
      end
    end
  end
end
