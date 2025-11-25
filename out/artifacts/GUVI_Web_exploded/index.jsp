<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Online Health Consultation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --bg-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --glass-bg: rgba(255, 255, 255, 0.95);
            --input-bg: #f3f4f6;
            --text-main: #1f2937;
            --text-sub: #6b7280;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: #a8c0ff;
            background: -webkit-linear-gradient(to right, #3f2b96, #a8c0ff);
            background: linear-gradient(to right, #3f2b96, #a8c0ff);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        /* Animated Background Bubbles (Optional visual flair) */
        body::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: radial-gradient(circle at 15% 50%, rgba(255, 255, 255, 0.1), transparent 25%),
            radial-gradient(circle at 85% 30%, rgba(255, 255, 255, 0.1), transparent 25%);
            pointer-events: none;
            z-index: 0;
        }

        .card {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 400px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.5);
            transform: translateY(0);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
        }

        h1 {
            margin: 0;
            font-size: 1.75rem;
            color: var(--text-main);
            font-weight: 700;
            text-align: center;
            letter-spacing: -0.5px;
        }

        .subtitle {
            margin-top: 0.5rem;
            margin-bottom: 2rem;
            font-size: 0.95rem;
            color: var(--text-sub);
            text-align: center;
            line-height: 1.4;
        }

        .field { margin-bottom: 1.2rem; }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.4rem;
            color: #374151;
            margin-left: 4px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 0.85rem 1rem;
            border-radius: 12px;
            border: 2px solid transparent;
            background: var(--input-bg);
            font-size: 0.95rem;
            transition: all 0.2s ease;
            color: #111827;
        }

        input:focus {
            outline: none;
            background: #ffffff;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        .btn-primary {
            width: 100%;
            margin-top: 0.5rem;
            border-radius: 12px;
            padding: 0.9rem;
            border: none;
            background: linear-gradient(135deg, #4f46e5 0%, #3b82f6 100%);
            color: #ffffff;
            font-weight: 600;
            cursor: pointer;
            font-size: 1rem;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .links {
            margin-top: 1.5rem;
            font-size: 0.9rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .links a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .links a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        /* Divider Design */
        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 1.5rem 0 1rem;
            color: #9ca3af;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e5e7eb;
        }
        .divider::before { margin-right: .5em; }
        .divider::after { margin-left: .5em; }

        .btn-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
        }

        .btn-secondary {
            width: 100%;
            padding: 0.65rem;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            background: #ffffff;
            color: #4b5563;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }

        .btn-secondary:hover {
            background: #f9fafb;
            border-color: #d1d5db;
            color: #111827;
        }

        .admin-badge {
            display: inline-block;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 0.7rem;
            padding: 2px 6px;
            border-radius: 4px;
            margin-left: 5px;
            font-weight: 700;
        }

        /* Error Animation */
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-4px); }
            20%, 40%, 60%, 80% { transform: translateX(4px); }
        }

        .error {
            margin-top: 1rem;
            padding: 0.75rem;
            border-radius: 8px;
            background-color: #fef2f2;
            color: #dc2626;
            font-size: 0.9rem;
            text-align: center;
            border: 1px solid #fecaca;
            animation: shake 0.4s cubic-bezier(.36,.07,.19,.97) both;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Welcome Back</h1>
    <div class="subtitle">
        Securely login to your Health Consultation dashboard.
    </div>

    <form action="login" method="post">
        <div class="field">
            <label for="email">Email Address</label>
            <input id="email" type="text" name="email" placeholder="name@example.com" required>
        </div>
        <div class="field">
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="••••••••" required>
        </div>

        <button type="submit" class="btn-primary">Sign In</button>
    </form>

    <div class="links">
        <a href="forgot_password.jsp">Forgot password?</a>
        <span style="color:#9ca3af; font-size: 0.85rem;">Don't have an account? <a href="register.jsp">Sign up</a></span>
    </div>

    <div class="divider">Project Demo Controls</div>

    <div class="btn-row">
        <form action="login" method="post" style="margin:0;">
            <input type="hidden" name="email" value="admin@health.com">
            <input type="hidden" name="password" value="admin123">
            <button type="submit" class="btn-secondary" title="One-click login for presentation">
                Admin Login <span class="admin-badge">DEMO</span>
            </button>
        </form>

        <a href="support.jsp" class="btn-secondary">
            Need Help?
        </a>
    </div>

    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
    <div class="error">
        <strong>Login Failed:</strong> Invalid email or password.
    </div>
    <% } %>
</div>

</body>
</html>