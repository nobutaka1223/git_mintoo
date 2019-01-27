class InquiryMailer < ApplicationMailer
    
    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
            from:'system@example.com',
            to: 'minnanotool@gmail.com',
            subject: 'メール内容')
    end
end
