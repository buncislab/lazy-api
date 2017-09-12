require 'fcm'
module FcmClient
  def notif(isinya,token)
    fcm = FCM.new("AAAAqEx1r2k:APA91bHGSzC79KBXj0QvDRkjo_COOe5QpjQ1NQ-JDjHbfOOlEKPpbF8KMpSevJQpp41FCdlpVTo7RAurdQaGMCgU8ls-cSITQR4zlNZfp-WyW0UTg7X55u_a7UHmahUEyDfrO-yhjl8i")
    options = {data: isinya, priority: "high", notification: isinya}
    response = fcm.send([token], options)
  end
end