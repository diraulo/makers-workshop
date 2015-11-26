require './lib/certificate_generator'

class Certificate
  include DataMapper::Resource
  include CertificateGenerator

  property :id, Serial
  property :identifier, Object
  property :created_at, ParanoidDateTime

  belongs_to :delivery
  belongs_to :student

  before :save do
    student_name = student.full_name
    course_name = delivery.course.title
    generated_at = created_at.to_s
    self.identifier = Digest::SHA256.hexdigest("#{student_name} - #{course_name} - #{generated_at}")
    self.save
  end

  after :create do
    CertificateGenerator.generate(self)
  end
end
