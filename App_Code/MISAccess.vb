Imports System.Data.OleDb
Imports System.Data

Public Class MISAccess
    Public Strcon As String
    Dim PV As String = "Provider=Microsoft.Jet.OLEDB.4.0;"
    'Dim m_DBPath As String = "C:\Documents and Settings\Administrator\My Documents\Count\App_Data\Counter.mdb"
    Dim m_DBPath As String = "C:\Inetpub\wwwroot\App_Data\Counter.mdb"
    'Dim m_DBPath As String = "C:\Documents and Settings\Administrator\My Documents\Count\App_Data\Counter.mdb"
    Dim m_Password As String = ""
    Public Sub New()
        If Dir(m_DBPath) = "" Then
            Err.Raise(60001, , "Database File : " & m_DBPath & " not found")
            Exit Sub
        End If
        Strcon = PV & "data source=" & m_DBPath
    End Sub
    Public Sub New(ByVal DBPath As String)
        If Dir(DBPath) = "" Then
            Err.Raise(60001, , "Database File : " & DBPath & " not found")
            Exit Sub
        End If
        m_DBPath = DBPath
        Strcon = PV & "data source=" & m_DBPath
    End Sub
    Public Property Password() As String
        Get
            Return m_Password
        End Get
        Set(ByVal Value As String)
            m_Password = Value
            Strcon = PV & "data source=" & m_DBPath & ";Jet OLEDB:Database Password=" & m_Password
        End Set
    End Property
    Public Function GetDataset(ByVal Strsql As String, _
        Optional ByVal DatasetName As String = "Dataset1", _
        Optional ByVal TableName As String = "Table1") As DataSet
        Dim DA As New OleDbDataAdapter(Strsql, Strcon)
        Dim DS As New DataSet(DatasetName)
        Try
            DA.Fill(DS, TableName)
        Catch x1 As Exception
            Err.Raise(60002, , x1.Message)
        End Try
        Return DS
    End Function

    Public Function GetDataTable(ByVal Strsql As String, _
         Optional ByVal TableName As String = "Table1") As DataTable
        Dim DA As New OleDbDataAdapter(Strsql, Strcon)
        Dim DT As New DataTable(TableName)
        Try
            DA.Fill(DT)
        Catch x1 As Exception
            Err.Raise(60002, , x1.Message)
        End Try
        Return DT
    End Function

    Public Function CreateCommand(ByVal Strsql As String) As OleDbCommand
        Dim cmd As New OleDbCommand(Strsql)
        Return cmd
    End Function

    Public Function Execute(ByVal Strsql As String) As Integer
        Dim cmd As New OleDbCommand(Strsql)
        Dim X As Integer = Me.Execute(cmd)
        Return X
    End Function

    Public Function Execute(ByRef Cmd As OleDbCommand) As Integer
        Dim Cn As New OleDbConnection(Strcon)
        Cmd.Connection = Cn
        Dim X As Integer
        Try
            Cn.Open()
            X = Cmd.ExecuteNonQuery()
        Catch
            X = -1
        Finally
            Cn.Close()
        End Try
        Return X
    End Function

    Public Sub CreateParam(ByRef Cmd As OleDbCommand, ByVal StrType As String)
        'T:Text, M:Memo, Y:Currency, D:Datetime, I:Integer, S:Single, B:Boolean
        Dim i As Integer
        Dim j As String
        For i = 1 To Len(StrType)
            j = UCase(Mid(StrType, i, 1))
            Dim P1 As New OleDbParameter()
            P1.ParameterName = "@P" & i
            Select Case j
                Case "T"
                    P1.OleDbType = OleDbType.VarChar
                Case "M"
                    P1.OleDbType = OleDbType.LongVarChar
                Case "Y"
                    P1.OleDbType = OleDbType.Currency
                Case "D"
                    P1.OleDbType = OleDbType.Date
                Case "I"
                    P1.OleDbType = OleDbType.Integer
                Case "S"
                    P1.OleDbType = OleDbType.Decimal
                Case "B"
                    P1.OleDbType = OleDbType.Boolean
            End Select
            Cmd.Parameters.Add(P1)
        Next
    End Sub
End Class

