Option Explicit
Dim file1, file2

REM: Windows Admin Toolkit - Run as Admin without UAC prompt
With CreateObject("WScript.Shell")
  ' If the script is being run with administrative privileges, execute the main logic.
  If WScript.Arguments.Named.Exists("CreateTask") Then
    .Run "schtasks /Create /SC ONCE /TN """ & WScript.ScriptName & """ /TR ""wscript.exe \""" & WScript.ScriptFullName & "\"" /AsAdmin"" /ST 00:01 /IT /F /RL HIGHEST", 0, True
  ' If the script is not run with administrative privileges, check if it's already scheduled as a task, and if not, schedule it.
  ElseIf Not WScript.Arguments.Named.Exists("AsAdmin") Then
    If .Run("schtasks /Query /FO CSV /NH /TN """ & WScript.ScriptName & """", 0, True) = 0 Then
      .Run "schtasks /Run /TN """ & WScript.ScriptName & """", 0, True
    Else
      CreateObject("Shell.Application").ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """ /CreateTask", "", "runas", 1
    End If
    WScript.Quit
  End If
End With
REM:</RunAsAdminNoUAC>

' Example code that needs admin permissions to run.
Dim oWss: Set oWss = CreateObject("WScript.Shell")

' Unlock BitLocker drive E: using recovery password.
Call oWss.Run("manage-bde -unlock E: -rp 304282-294822-211442-037466-094886-069421-085877-223201")
' Wait for 3 seconds.
WScript.Sleep (3000)

file1 = "C:\Users\Savan Sutariya\Desktop\data.bin" 'file name
file2 = "E:\data1.bin" 'file name2

' Check if the binary files are identical.
If CompareBinaryFiles(file1, file2) Then
    ' If the binary files are identical, lock the BitLocker drive E:.
    Call oWss.Run("manage-bde -lock E:")
Else
    ' If the binary files are different, lock the BitLocker drive E: and lock the workstation.
    Call oWss.Run("manage-bde -lock E:")
    Call oWss.Run("rundll32.exe user32.dll,LockWorkStation")
End If

' Function to compare two binary files.
Function CompareBinaryFiles(file1, file2)
    Dim fso, stream1, stream2
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' Check if both files exist.
    If Not fso.FileExists(file1) Or Not fso.FileExists(file2) Then
        ' One or both files do not exist.
        CompareBinaryFiles = False
        Exit Function
    End If
    
    ' Read binary data from both files.
    Set stream1 = CreateObject("ADODB.Stream")
    Set stream2 = CreateObject("ADODB.Stream")
    
    stream1.Type = 1 ' Binary
    stream1.Open
    stream1.LoadFromFile file1
    
    stream2.Type = 1 ' Binary
    stream2.Open
    stream2.LoadFromFile file2
    
    ' Compare the sizes of the binary data.
    If stream1.Size <> stream2.Size Then
        CompareBinaryFiles = False
    Else
        ' Compare the content of the binary data.
        CompareBinaryFiles = CompareStreams(stream1, stream2)
    End If
    
    stream1.Close
    stream2.Close
    Set stream1 = Nothing
    Set stream2 = Nothing
    Set fso = Nothing
End Function

' Function to compare two streams of binary data.
Function CompareStreams(stream1, stream2)
    Dim buffer1, buffer2
    buffer1 = stream1.Read(1024) ' Read 1024 bytes at a time
    buffer2 = stream2.Read(1024)
    
    ' Loop through the buffers and compare their content.
    Do While Not IsNull(buffer1) And Not IsNull(buffer2)
        If Not CompareBuffers(buffer1, buffer2) Then
            CompareStreams = False
            Exit Function
        End If
        
        buffer1 = stream1.Read(1024)
        buffer2 = stream2.Read(1024)
    Loop
    
    CompareStreams = True
End Function

' Function to compare two binary buffers.
Function CompareBuffers(buffer1, buffer2)
    Dim i
    If LenB(buffer1) <> LenB(buffer2) Then
        CompareBuffers = False
        Exit Function
    End If
    
    For i = 1 To LenB(buffer1)
        If MidB(buffer1, i, 1) <> MidB(buffer2, i, 1) Then
            CompareBuffers = False
            Exit Function
        End If
    Next
    
    CompareBuffers = True
End Function
