<script runat="server">


    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim decAmount As Decimal

        Dim decDep As Decimal
        Dim intTerm As Integer
        Dim decIR As Decimal
        Dim decPayment As Decimal
        Dim decTotalAmnt As Decimal

        If Decimal.TryParse(txtPrice.Text, decAmount) Then
            If Decimal.TryParse(txtDeposit.Text, decDep) Then

                If Integer.TryParse(txtTerm.Text, intTerm) Then

                    If Decimal.TryParse(txtInterest.Text, decIR) Then

                        decIR = (decIR / 100) / 12
                        intTerm = intTerm * 12
                        decAmount = decAmount - decDep
                        decPayment = (decAmount * decIR) / (1 - Math.Pow(1 + decIR, -intTerm))
                        decTotalAmnt = decPayment * intTerm

                        lblOutput.Text = "Principal amount:" & decAmount & vbCrLf & "Term:" & intTerm & vbCrLf & "Monthly Interest Rate:" & decIR.ToString("N3") & vbCrLf & "Monthly paypent:" & decPayment.ToString("N2") & "\nLine Total Amount Payanle to The bank:" & decTotalAmnt.ToString("N2")

                        lstDisplay.Items.Add("Principal amount:" & decAmount)

                        lstDisplay.Items.Add("Test 2")
                        lstDisplay.Items.Add("Test 2")
                        lstDisplay.Items.Add("Test 2")
                        lstDisplay.Items.Add("Test 2")
                    Else

                        lblOutput.Text = "Please provide valid interest rate"
                    End If
                Else

                    lblOutput.Text = "Please provide valid term"
                End If
            Else

                lblOutput.Text = "Please provide valid deposit amount"
            End If

        Else

            lblOutput.Text = "Please provide valid purchase price"
        End If

    End Sub
</script>


<link href="Content/bootstrap.css" rel="stylesheet" />


<link href="Content/Site.css" rel="stylesheet" />

    <form id="form1" runat="server">

    <div class="text-center">
        <h1 class="display-4">Home Loan Estimator</h1>
       
        <div class="form-group row">
            <div class="col-xs-2">
                <label for="ex1">
                    Purchase Price
                </label>
                 <asp:TextBox ID="txtPrice" class="form-control" runat="server"></asp:TextBox>
                <label for="ex1">Deposit (Optional)</label>
                 <asp:TextBox class="form-control" ID="txtDeposit" runat="server">0</asp:TextBox>
                <label for="ex1">Bond term(Years)</label>
                 <asp:TextBox class="form-control" ID="txtTerm" runat="server"></asp:TextBox>
                <label for="ex1">Interest rate</label>
                 <asp:TextBox class="form-control"  ID="txtInterest" runat="server"></asp:TextBox>
           
                <br />
              
                <div style="margin-right=20px">
               <asp:Button ID="Button1" class="form-control" runat="server" Text="Calculate" OnClick="Button1_Click" />
  </div>
                
            </div>
        </div>
    </div> 
        
       
        <asp:Label ID="lblOutput" runat="server"></asp:Label>
        <asp:ListBox ID="lstDisplay" runat="server" Height="179px" Width="301px"></asp:ListBox>
       
</form>
 
