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
#                                  root GET    /                                                                                        users/dashboard#index
#                      teachers_courses GET    /courses(.:format)                                                                       teachers/courses#index
#                                       POST   /courses(.:format)                                                                       teachers/courses#create
#                   new_teachers_course GET    /courses/new(.:format)                                                                   teachers/courses#new
#                  edit_teachers_course GET    /courses/:id/edit(.:format)                                                              teachers/courses#edit
#                       teachers_course GET    /courses/:id(.:format)                                                                   teachers/courses#show
#                                       PATCH  /courses/:id(.:format)                                                                   teachers/courses#update
#                                       PUT    /courses/:id(.:format)                                                                   teachers/courses#update
#                                       DELETE /courses/:id(.:format)                                                                   teachers/courses#destroy
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
    root 'users/dashboard#index'
    resources :courses,
              path: 'courses',
              controller: 'teachers/courses',
              as: :teachers_courses
  end
end
