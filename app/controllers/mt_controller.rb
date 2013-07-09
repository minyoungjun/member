#coding: utf-8
class MtController < ApplicationController

def hacker

@hk = Hacker.all
@ip_add = request.remote_ip

if session[:idid] != nil

@name = Member.find(session[:idid]).username
elsif session[:check] != nil
@name = Member.find(session[:check]).username

else
@name = "알수없음"
end

ha = Hacker.new
ha.username = @name
ha.ip_add = @ip_add
ha.save

end

def index

end

def login

end

def list

end

def secret

if (Member.find_by_username(params[:usname]) == nil)
mem = Member.new
mem.username = params[:usname]
mem.animal = params[:animal]
mem.passwd = params[:passwd]
mem.content = params[:story]
mem.save

session[:idid] = mem.id

redirect_to :action => "photo"

else

redirect_to :action => "error"
end

end



def check

if (params[:id] != nil || session[:check] == nil)

redirect_to :action => "hacker"

else

@mem = Member.find(session[:check])
  
end

end

def login_process

wow = Member.find_by_username_and_passwd(params[:usname], params[:passwd])
if  wow != nil
session[:check] = wow.id
  redirect_to :action => "check"
else
  redirect_to :action => "not"
end

end




def upload
if params[:img] != nil

  img = Photo.new
  img.realname = params[:img].original_filename
  img.savedname = SecureRandom.hex(5) + img.realname
  img.member_id = session[:idid]
  if img.save
    
    f = File.open(Rails.root.join("public", "img", img.savedname), "wb")

    f.write(params[:img].read)
    f.close
    end
end

    redirect_to :action => "complete"

end

def complete

end




end
