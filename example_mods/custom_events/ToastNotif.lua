function onEvent(n, v1, v2)
    if n == 'eventname' then
      doToastNotification(v1, v2)
    end
  end


  function doToastNotification(title, desc)
    io.popen([[ powershell -Command "& {$ErrorActionPreference = 'Stop';$title = ]] ..  [[']] .. desc .. [[']] .. [[;[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null;$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01);$toastXml = [xml] $template.GetXml();$toastXml.GetElementsByTagName('text').AppendChild($toastXml.CreateTextNode($title)) > $null;$xml = New-Object Windows.Data.Xml.Dom.XmlDocument;$xml.LoadXml($toastXml.OuterXml);$toast = [Windows.UI.Notifications.ToastNotification]::new($xml);$toast.Tag = 'Test1';$toast.Group = 'Test2';$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5);$notifier = [Windows.UI.Notifications.ToastNotificationManager]:]].. [[:CreateToastNotifier(']] .. title  .. [[');]].. [[$notifier.Show($toast);}"]] )
    addHaxeLibrary('Application', 'lime.app')
    runHaxeCode("Application.current.window.focus();")
end