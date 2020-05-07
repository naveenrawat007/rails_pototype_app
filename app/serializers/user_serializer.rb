class UserSerializer < ActiveModel::Serializer
  def attributes(*args)
    data = super
    data[:id] = object.id
    data[:name] = object.name
    data[:gender] = object.gender
    data[:email] = object.email
    data[:phone_number] = object.phone_number
    if self.instance_options[:serializer_options]
      data[:token] = self.instance_options[:serializer_options][:token]
    end
    data
  end
end
