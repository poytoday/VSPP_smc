Imports System.Data.SqlClient
Imports System.Data
Public Class MISSQL
    'Dim PV As String = "Server=N3SCMSA09\SQLEXPRESS;uid=sa;pwd=1234;"
    Dim PV As String = "Server=172.30.203.155;uid=sa;pwd=1234;"
    Dim m_Database As String = "Device_sa"
    Public Strcon As String
    Public Sub New()
        Strcon = PV & "database=" & m_Database
    End Sub
    Public Sub New(ByVal DBName As String)
        m_Database = DBName
        Strcon = PV & "database=" & m_Database
    End Sub
    Public Property Database() As String
        Get
            Return m_Database
        End Get
        Set(ByVal Value As String)
            m_Database = Value
            Strcon = PV & "database=" & m_Database
        End Set
    End Property

    Public Function GetDataset(ByVal Strsql As String, _
        Optional ByVal DatasetName As String = "Dataset1", _
        Optional ByVal TableName As String = "Table") As DataSet
        Dim DA As New SqlDataAdapter(Strsql, Strcon)
        Dim DS As New DataSet(DatasetName)
        Try
            DA.Fill(DS, TableName)
        Catch x1 As Exception
            'Err.Raise(60002, , x1.Message)
        End Try
        Return DS
    End Function

    Public Function GetDataTable(ByVal Strsql As String, _
         Optional ByVal TableName As String = "Table") As DataTable
        Dim DA As New SqlDataAdapter(Strsql, Strcon)
        Dim DT As New DataTable(TableName)
        Try
            DA.Fill(DT)
        Catch x1 As Exception
            'Err.Raise(60002, , x1.Message)
        End Try
        Return DT
    End Function

    Public Function CreateCommand(ByVal Strsql As String) As SqlCommand
        Dim cmd As New SqlCommand(Strsql)
        Return cmd
    End Function

    Public Function Execute(ByVal Strsql As String) As Integer
        Dim cmd As New SqlCommand(Strsql)
        Dim X As Integer = Me.Execute(cmd)
        Return X
    End Function

    Public Function Execute(ByRef Cmd As SqlCommand) As Integer
        Dim Cn As New SqlConnection(Strcon)
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

    Public Sub CreateParam(ByRef Cmd As SqlCommand, ByVal StrType As String)
        'T:Text, M:Memo, Y:Currency, D:Datetime, I:Integer, S:Single, B:Boolean, P: Picture
        Dim i As Integer
        Dim j As String
        For i = 1 To Len(StrType)
            j = UCase(Mid(StrType, i, 1))
            Dim P1 As New SqlParameter
            P1.ParameterName = "@P" & i
            Select Case j
                Case "T"
                    P1.SqlDbType = SqlDbType.VarChar
                Case "M"
                    P1.SqlDbType = SqlDbType.Text
                Case "Y"
                    P1.SqlDbType = SqlDbType.Money
                Case "D"
                    P1.SqlDbType = SqlDbType.DateTime
                Case "I"
                    P1.SqlDbType = SqlDbType.Int
                Case "S"
                    P1.SqlDbType = SqlDbType.Decimal
                Case "B"
                    P1.SqlDbType = SqlDbType.Bit
                Case "P"
                    P1.SqlDbType = SqlDbType.Image
            End Select
            Cmd.Parameters.Add(P1)
        Next
    End Sub
End Class
