class Mailer < ApplicationMailer
    default from: "foxhound.ucla@gmail.com"

    def send_email(asunto, email)
        puts email, "send_email"
        mail( 
                subject: asunto,
                to: email   
            )
    end
    
    def bienvenida(asunto, email)
        puts email, "send_email"
        mail( 
                subject: asunto,
                to: email   
            )
    end

    def notificacion_visita(asunto, email)
        mail(   
                subject: asunto,
                to: email
            )
    end
end
