# Kohai Metabase

Metabase analytics platform configured for deployment on Render.

## What is Metabase?

Metabase is an open-source business intelligence tool that helps you ask questions about your data and visualize the answers.

## Quick Deploy to Render with Neon Database

### Prerequisites
- A [Render](https://render.com/) account (free tier available)
- A [Neon](https://neon.tech/) account (free tier available)
- A GitHub account

### Deployment Steps

**📖 See [NEON_SETUP.md](./NEON_SETUP.md) for detailed step-by-step instructions**

#### Quick Summary:

1. **Create Neon Database**
   - Sign up at [Neon Console](https://console.neon.tech/)
   - Create a new project
   - Copy the **pooled connection string**

2. **Deploy on Render**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New +" → "Web Service"
   - Connect this GitHub repository
   - Add environment variable:
     - `MB_DB_CONNECTION_URI` = (your Neon connection string)
   - Click "Create Web Service"

3. **Access Your Metabase**
   - Wait 10-15 minutes for deployment
   - Click on the web service URL
   - Complete the initial Metabase setup wizard
   - Create your admin account
   - Start analyzing your data

### Why Neon Database?

- **Better Free Tier**: 3GB storage vs Render's 1GB
- **Always On**: No auto-suspend on free tier
- **Faster**: Better performance and reliability
- **Serverless**: Auto-scales when needed

## Project Structure

```
kohai-metabase/
├── Dockerfile              # Docker configuration for Render
├── render.yaml            # Render deployment configuration
├── NEON_SETUP.md          # Detailed Neon database setup guide
├── start.sh              # Startup script for Metabase
├── package.json          # Node.js project metadata
├── .env.example          # Environment variables template
├── .gitignore           # Git ignore rules
└── README.md            # This file
```

## Configuration

### Environment Variables

Required environment variables for Render:

- `MB_DB_TYPE`: Database type (postgres)
- `MB_DB_CONNECTION_URI`: Your Neon database connection string
- `PORT`: Application port (3000)
- `MB_JETTY_PORT`: Metabase server port (3000)

See `.env.example` for a complete list of available configuration options.

### Custom Configuration

To customize your Metabase deployment:

1. Edit the environment variables in Render Dashboard
2. Refer to [Metabase Documentation](https://www.metabase.com/docs/latest/) for additional configuration options
3. See [NEON_SETUP.md](./NEON_SETUP.md) for database-specific configuration

## Local Development

To run Metabase locally:

```bash
# Make sure you have Java installed
java -version

# Run Metabase
java -jar metabase.jar
```

Visit `http://localhost:3000` to access Metabase.

## Database

This deployment uses **Neon PostgreSQL** as the application database:

- **Production**: Neon serverless PostgreSQL (3GB free tier)
- **Local Development**: H2 database files (included in repo, not used in production)

See [NEON_SETUP.md](./NEON_SETUP.md) for detailed database setup instructions.

## Free Tier Limitations

### Render Web Service (Free Tier)
- Spins down after 15 minutes of inactivity
- First request after spin-down takes 30-60 seconds
- 750 hours of runtime per month
- 512MB RAM

### Neon Database (Free Tier)
- 3GB storage
- Auto-suspends after inactivity (resumes in milliseconds)
- Unlimited compute hours
- 1 project

## Troubleshooting

### Service won't start
- Check the Render logs for errors
- Verify `MB_DB_CONNECTION_URI` is set correctly in Render environment variables
- Ensure Neon database connection string includes `?sslmode=require`

### Can't connect to Neon database
- Verify you're using the **pooled connection** string from Neon
- Check connection string format: `postgresql://user:pass@host.neon.tech/db?sslmode=require`
- Ensure Neon database is active (check Neon console)

### Slow performance
- Render free tier spins down after 15 minutes of inactivity
- First request after spin-down takes 30-60 seconds
- Consider upgrading to Render paid plan ($7/month) for always-on service

### Out of memory errors
- The Dockerfile is optimized for 512MB RAM (Render free tier)
- If issues persist, consider upgrading to a larger Render plan

See [NEON_SETUP.md](./NEON_SETUP.md) for more troubleshooting tips

## Support

For Metabase-specific questions:
- [Metabase Documentation](https://www.metabase.com/docs/latest/)
- [Metabase Forum](https://discourse.metabase.com/)

For Render deployment issues:
- [Render Documentation](https://render.com/docs)
- [Render Community](https://community.render.com/)

For Neon database issues:
- [Neon Documentation](https://neon.tech/docs)
- [Neon Discord](https://discord.gg/92vNTzKDGp)

## License

This project is licensed under the MIT License. Metabase is licensed under the [AGPL license](https://github.com/metabase/metabase/blob/master/LICENSE.txt).
