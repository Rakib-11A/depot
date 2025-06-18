class SupportRequestsController < ApplicationController
  def index
    @support_requests =  SupportRequest.all
  end
  def update
    support_request = SupportRequest.find(params[:id])
    if @support_request.nil?
      redirect_to support_requests_path, alert: "There is no support request found"
      return
    end
    if support_request.update(response: params.require(:support_request)[:response])
      SupportRequestMailer.respond(@support_request).deliver_now
      redirect_to support_requests_path, notice: "Response sent successfully."
    else
      redirect_to support_requests_path, alert: "Failed to send response"
    end
  end

end
