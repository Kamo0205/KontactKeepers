﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using FacebookAPI;
using BusinessLogic;

namespace Interface
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            btnCalls1.Click += new EventHandler(btnCalls_Click);
            btnClients1.Click += new EventHandler(btnClients_Click);
            btnContracts1.Click += new EventHandler(btnContracts_Click);
            FBConf.Login("jannesdownload09@gmail.com", "V@facebook009");
            refresh();
        }
        
        public void refresh()
        {
            Connector cn = new Connector();
            BindingSource bsA = new BindingSource();
            BindingSource bsC = new BindingSource();
            BindingSource bsE = new BindingSource();
            bsA.DataSource = cn.GetAdmins();
            bsC.DataSource = cn.GetFBUsers();
            bsE.DataSource = cn.GetFBUsers();

            dgvAdmin.DataSource = bsA;
            dgvCallAgent.DataSource = bsC;
            dgvEndUser.DataSource = bsE;
        }
        

        private void btnSettings_Click(object sender, EventArgs e)
        {
            frmSettings frmsettings = new frmSettings();
            frmsettings.Show();
        }

        private void frmMain_Activated(object sender, EventArgs e)
        {
            if (ConfigurationManager.AppSettings.Get("Fullscreen") == "1")
            {
                var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                config.AppSettings.Settings["Fullscreen"].Value = "1";
                config.Save(ConfigurationSaveMode.Modified);

                ConfigurationManager.RefreshSection("appSettings");

                this.WindowState = FormWindowState.Maximized;
            }
            else
            {
                var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                config.AppSettings.Settings["Fullscreen"].Value = "0";
                config.Save(ConfigurationSaveMode.Modified);

                ConfigurationManager.RefreshSection("appSettings");

                this.WindowState = FormWindowState.Normal;
            }
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            btnHome.Focus();
            panButtons.Hide();
            panAdmins.Hide();
            panCallAgents.Hide();
            panEndUsers.Hide();
            panHome.Show();
            refresh();
        }
        private void btnCalls_Click(object sender, EventArgs e)
        {

            this.ActiveControl = this.btnCalls;
            panButtons.Show();
            panAdmins.Show();
            panCallAgents.Hide();
            panEndUsers.Hide();
            panHome.Hide();
            refresh();
        }

        private void btnClients_Click(object sender, EventArgs e)
        {
            this.ActiveControl = this.btnClients;
            panButtons.Show();
            panAdmins.Hide();
            panCallAgents.Show();
            panEndUsers.Hide();
            panHome.Hide();
            refresh();
        }

        private void btnContracts_Click(object sender, EventArgs e)
        {
            this.ActiveControl = this.btnContracts;
            panButtons.Show();
            panAdmins.Hide();
            panCallAgents.Hide();
            panEndUsers.Show();
            panHome.Hide();
            refresh();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            refresh();
        }

        private void btnCAAdd_Click(object sender, EventArgs e)
        {
            Connector cn = new Connector();
        }

    }
}