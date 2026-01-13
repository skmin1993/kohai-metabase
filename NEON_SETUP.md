# Setting Up Metabase with Neon PostgreSQL

This guide shows you how to deploy Metabase on Render using Neon's free PostgreSQL database.

## Why Neon?

- **Generous Free Tier**: 3GB storage, always-on
- **Serverless**: Auto-scales and suspends when idle
- **Faster**: Better performance than Render's free PostgreSQL
- **Reliable**: Built for production workloads

## Step 1: Create Neon Database

1. Go to [Neon Console](https://console.neon.tech/)
2. Sign up for a free account
3. Click **"Create a project"**
4. Configure your project:
   - **Project name**: `metabase-db` (or any name you prefer)
   - **Region**: Choose closest to your Render region (US East, EU, etc.)
   - **PostgreSQL version**: 16 (recommended)
5. Click **"Create project"**

## Step 2: Get Database Connection String

After creating the project:

1. On the project dashboard, find the **"Connection string"** section
2. Select **"Pooled connection"** (recommended for serverless)
3. Copy the connection string - it looks like:
   ```
   postgresql://username:password@ep-xxx-xxx.region.neon.tech/neondb?sslmode=require
   ```
4. **Save this connection string** - you'll need it for Render

## Step 3: Deploy on Render

### Option A: Using Environment Variable (Recommended)

1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository: `kohai-metabase`
4. Configure the service:
   - **Name**: `kohai-metabase`
   - **Environment**: Docker
   - **Plan**: Free
   - **Docker Command**: (leave blank, uses Dockerfile CMD)

5. Add environment variables:
   - Click **"Advanced"** → **"Add Environment Variable"**
   - Add this variable:
     ```
     Key: MB_DB_CONNECTION_URI
     Value: postgresql://your-username:your-password@your-host.neon.tech/neondb?sslmode=require
     ```
     (Paste your Neon connection string from Step 2)

6. Click **"Create Web Service"**

### Option B: Using Blueprint (Alternative)

1. In Render Dashboard, click **"New +"** → **"Blueprint"**
2. Select your GitHub repo
3. Before applying, Render will show environment variables to configure
4. Set `MB_DB_CONNECTION_URI` to your Neon connection string
5. Click **"Apply"**

## Step 4: Wait for Deployment

- Initial deployment takes 10-15 minutes
- Render will:
  1. Build the Docker image
  2. Download Metabase
  3. Connect to Neon database
  4. Initialize Metabase schema

## Step 5: Access Metabase

1. Once deployed, click on your service URL (e.g., `https://kohai-metabase.onrender.com`)
2. Complete the Metabase setup wizard:
   - Create your admin account
   - Choose language and preferences
   - Skip connecting data sources (do this later)
3. Start using Metabase!

## Troubleshooting

### Connection Failed

If Metabase can't connect to Neon:

1. **Check connection string**: Make sure you copied it correctly
2. **Use pooled connection**: In Neon dashboard, select "Pooled connection" string
3. **Verify SSL**: Connection string must include `?sslmode=require`

### Out of Memory

If deployment fails with memory errors:

1. The Dockerfile is already optimized for 512MB RAM
2. Wait for Render's health check to stabilize (can take 2-3 minutes)
3. Check Render logs for specific errors

### Slow First Load

- Render free tier spins down after 15 minutes of inactivity
- First request after spin-down takes 30-60 seconds
- This is normal for free tier

## Neon Database Management

### View Database

1. Go to [Neon Console](https://console.neon.tech/)
2. Select your project
3. Click **"SQL Editor"** to run queries
4. View tables created by Metabase

### Monitor Usage

1. In Neon Console, click **"Usage"**
2. Monitor storage (3GB limit on free tier)
3. View query statistics

### Backup

Neon automatically handles backups. To export manually:

1. Use `pg_dump` with your connection string:
   ```bash
   pg_dump "postgresql://user:pass@host.neon.tech/neondb" > backup.sql
   ```

## Cost

- **Neon Free Tier**: 3GB storage, unlimited compute (with auto-suspend)
- **Render Free Tier**: 750 hours/month, 512MB RAM, spins down after 15 min
- **Total Cost**: $0/month

## Production Considerations

For production use, consider:

- Upgrading Render to paid plan ($7/month) for always-on service
- Neon Pro for larger databases and no auto-suspend
- Setting up regular backups
- Configuring email alerts in Metabase

## Need Help?

- [Neon Documentation](https://neon.tech/docs)
- [Render Documentation](https://render.com/docs)
- [Metabase Documentation](https://www.metabase.com/docs/latest/)
