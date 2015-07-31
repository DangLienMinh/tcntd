# encoding: utf-8
class Contact < ActiveRecord::Base
  validates :name,
            :presence => {:message=>'Không được để trống họ tên.'},
            :length => { :minimum => 5 , :message => "Nhập tên nhiều hơn 5 ký tự."}
  validates :phone,
            :presence => {:message=>'Không được để trống số điện thoại.'},
            :length => { :minimum =>8,:maximum => 13, :message => "Nhập số điện thoại chưa đúng"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,:message => 'Email nhập chưa đúng'
  validates :subject,
            :presence => {:message=>'Không được để trống tiêu đề.'},
            :length => { :minimum => 5,:message=>'Nhập tiêu đề nhiều hơn 5 ký tự.' }
  validates :message,
            :presence =>{:message=>'Không được để trống nội dung.'},
            :length => { :minimum => 5,:message=>'Nhập tiêu đề nhiều hơn 5 ký tự.'}
end
