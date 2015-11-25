require 'prawn'

module CertificateGenerator

  def self.generate(certificate)
    details = {
      name: certificate.student.full_name,
      date: certificate.delivery.start_date.to_s,
      course_name: certificate.delivery.course.title,
      course_desc: certificate.delivery.course.description
    }

    output = "pdf/#{details[:name]}-#{details[:date]}.pdf"
    File.delete(output) if File.exist?(output)
    Prawn::Document.generate(output) do |pdf|
      pdf.text 'CERTIFICATE'
      pdf.text 'This is to certify, that'
      pdf.text details[:name]
      pdf.text 'has successfully participated in '
      pdf.text details[:course_name]
      pdf.text details[:course_desc]
      pdf.text "Issued on #{details[:date]}"
      pdf.text certificate.identifier
    end
  end
end
