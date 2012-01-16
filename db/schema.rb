# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120112193911) do

  create_table "admins", :force => true do |t|
    t.integer  "Player_id"
    t.integer  "Team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["Player_id"], :name => "index_admins_on_Player_id"
  add_index "admins", ["Team_id"], :name => "index_admins_on_Team_id"

  create_table "appearances", :force => true do |t|
    t.integer  "friends"
    t.integer  "points"
    t.integer  "rsvp"
    t.integer  "player_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appearances", ["event_id"], :name => "index_appearances_on_event_id"
  add_index "appearances", ["player_id"], :name => "index_appearances_on_player_id"

  create_table "events", :force => true do |t|
    t.datetime "starttime"
    t.integer  "location_id"
    t.integer  "appearance_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["appearance_id"], :name => "index_events_on_appearance_id"
  add_index "events", ["location_id"], :name => "index_events_on_location_id"
  add_index "events", ["team_id"], :name => "index_events_on_team_id"

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "team_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    add_index "invitations", ["team_id"], :name => "index_invitations_on_team_id"
  add_index "invitations", ["sender_id"], :name => "index_invitations_on_sender_id"

  create_table "locations", :force => true do |t|
    t.string   "nick"
    t.string   "mapurl"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
  end

  create_table "members", :force => true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["player_id"], :name => "index_members_on_player_id"
  add_index "members", ["team_id"], :name => "index_members_on_team_id"

  create_table "players", :force => true do |t|
    t.string   "nick"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
  end

  create_table "team_invites", :force => true do |t|
    t.string   "body"
    t.string   "invitee_email"
    t.integer  "event_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_invites", ["event_id"], :name => "index_team_invites_on_event_id"
  add_index "team_invites", ["member_id"], :name => "index_team_invites_on_member_id"

  create_table "teams", :force => true do |t|
    t.string   "nick"
    t.string   "blogurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
