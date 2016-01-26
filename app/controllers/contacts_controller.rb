# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  favorite   :boolean
#

class ContactsController < ApplicationController
  def index
    @id = params[:user_id]
    @contacts = User.find(@id).contacts + User.find(@id).shared_contacts
    render json: @contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def show
    if params[:id]
      @contact = Contact.find(params[:id])
      render json: @contact
    else
      render(
      json: @contact.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def update
    if params[:id]
      @contact = Contact.find(params[:id])
      @contact.update!(contact_params)
      render json: @contact
    else
      render(
      json: @contact.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def destroy
    if params[:id]
      @contact = Contact.find(params[:id])
      @contact.delete
      render json: Contact.all
    else
      render(
      json: @contact.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def favorite
    if params[:id]
      @contact = Contact.find(params[:id])
      @contact.update(favorite: true)
      contact_lists = User.find(params[:user_id]).contacts
      favorite_contacts = contact_lists.where(favorite: true)
      render json: favorite_contacts
    else
      render(
      json: @contact.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
