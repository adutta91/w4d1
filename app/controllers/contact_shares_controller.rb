# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactSharesController < ApplicationController

  def create
    contact_share = ContactShare.new(contact_shares_params)
    if contact_share.save
      render json: contact_share
    else
      render(
        json: contact_share.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end


  def destroy
    if params[:id]
      @contact_share = ContactShare.find(params[:id])
      @contact_share.delete
      render json: @contact_share
    else
      render(
      json: @contact_share.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  private

  def contact_shares_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end


end
